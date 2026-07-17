#!/usr/bin/env ruby
# frozen_string_literal: true

# Generate navigation index.md files for the mechanically-extracted
# `references/` and `style-guide/` trees.
#
# These trees are NOT part of the OKF bundle (their files have no OKF
# frontmatter); the generated index.md files are plain-Markdown navigation
# aids, kept current by `make references` / `make style-guide`.
#
# Usage: bin/generate_indexes.rb [references|style-guide|all]

require "pathname"

REPO = Pathname.new(__dir__).parent

AREAS = %w[rails hotwire-native stimulus strada turbo kamal].freeze
AREA_TITLES = {
  "rails" => "Rails Guides", "hotwire-native" => "Hotwire Native",
  "stimulus" => "Stimulus", "strada" => "Strada", "turbo" => "Turbo",
  "kamal" => "Kamal"
}.freeze

# Whole-word fixups for names that simple capitalization gets wrong.
ACRONYMS = {
  "rspec" => "RSpec", "css" => "CSS", "html" => "HTML", "api" => "API",
  "cli" => "CLI", "ssh" => "SSH", "ssl" => "SSL", "sql" => "SQL",
  "url" => "URL", "io" => "IO", "http" => "HTTP", "yaml" => "YAML",
  "json" => "JSON", "typescript" => "TypeScript"
}.freeze

def titleize(slug)
  slug.sub(/\A\d+[_-]/, "").gsub(/[_-]+/, " ").strip.split.map do |w|
    next w if w.empty?

    ACRONYMS[w.downcase] || (w[0].upcase + w[1..])
  end.join(" ")
end

def unquote(str)
  s = str.strip
  s = s[1..-2] if s.length >= 2 && %w[" '].include?(s[0]) && s[-1] == s[0]
  s
end

# First real title: frontmatter `title:`, else first ATX/Setext heading in the
# body (skipping the "DO NOT READ" / generated-from-source preamble), else a
# titleized filename.
def doc_title(path)
  lines = File.read(path).lines.map(&:chomp)
  body_start = 0
  if lines.first == "---"
    close = lines[1..].index("---")
    if close
      fm = lines[1..close]
      t = fm.find { |l| l =~ /\Atitle:/ }
      return unquote(t.split(":", 2)[1]) if t

      body_start = close + 2 # skip past the closing ---
    end
  end
  lines[body_start, 20].to_a.each_with_index do |l, i|
    s = l.strip
    next if s.empty? || s.start_with?("**", "<")
    return s[2..].strip if s.start_with?("# ")

    nxt = lines[body_start + i + 1]
    return s if nxt && nxt.strip.match?(/\A=+\z/) # Setext H1
  end
  titleize(File.basename(path, ".md"))
end

def md_files(dir)
  Pathname.glob(dir.join("**/*.md")).reject { |p| p.basename.to_s == "index.md" }.sort
end

def gen_references
  base = REPO.join("references")
  out = +"# References\n\n"
  out << "> Documentation mechanically extracted from upstream git submodules " \
         "(Rails guides, Hotwire, Kamal, RuboCop) via `make references`. These " \
         "files are **not** part of the OKF bundle — they carry no OKF frontmatter. " \
         "Regenerate this index with `make references-index`.\n"

  AREAS.each do |area|
    adir = base.join(area)
    next unless adir.directory?

    files = md_files(adir)
    next if files.empty?

    # Prefix each entry with its immediate-parent subsection only when the area
    # spans more than one subsection (e.g. Kamal's configuration/commands/hooks).
    subsections = files.map { |f| f.parent.basename.to_s }.uniq
    prefix = subsections.length > 1

    label = lambda do |f, text|
      prefix ? "#{titleize(f.parent.basename.to_s)}: #{text}" : text
    end
    entries = files.map { |f| [f, label.call(f, doc_title(f))] }

    # Disambiguate duplicate labels (e.g. Kamal's docs.md and help.md both
    # carry `title: Help` upstream) by falling back to the titleized filename.
    dup = entries.map { |_, t| t }.tally
    entries = entries.map do |f, t|
      dup[t] > 1 ? [f, label.call(f, titleize(File.basename(f, ".md")))] : [f, t]
    end

    out << "\n## #{AREA_TITLES.fetch(area, titleize(area))}\n\n"
    entries.each { |f, t| out << "* [#{t}](#{f.relative_path_from(base)})\n" }
  end
  write(base.join("index.md"), out)
end

def gen_style_guide
  base = REPO.join("style-guide")
  out = +"# Style Guides\n\n"
  out << "> RuboCop community style guides extracted from upstream submodules via " \
         "`make style-guide`. Not part of the OKF bundle. Regenerate this index " \
         "with `make style-guide-index`.\n\n"
  Dir.children(base).select { |f| f.end_with?(".adoc") }.sort.each do |f|
    out << "* [#{titleize(File.basename(f, '.adoc'))} Style Guide](#{f})\n"
  end
  write(base.join("index.md"), out)
end

def write(path, text)
  File.write(path, text.gsub(/\n{3,}/, "\n\n"))
  puts "wrote #{Pathname.new(path).relative_path_from(REPO)}"
end

what = ARGV[0] || "all"
gen_references if %w[references all].include?(what)
gen_style_guide if %w[style-guide all].include?(what)
