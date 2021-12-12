#!/usr/bin/env ruby

# Script for generating color schemes from templates

require 'erb'
require 'pathname'
require 'yaml'

class Scheme
  attr_accessor :scheme_name
  attr_accessor :foreground, :background

  '00'.upto('15') do |i|
    attr_accessor :"base#{i}"
  end

  def initialize(h)
    h.each do |key, value|
      __send__(:"#{key}=", value)
    end
  end

  def binding_vars
    binding
  end
end

class Template
  attr_accessor :output_filename, :template_name
  attr_accessor :template

  def initialize(h, template)
    @template = template

    h.each do |key, value|
      __send__(:"#{key}=", value)
    end
  end

  def render(scheme)
    puts "rendering #{template_name} with scheme #{scheme.scheme_name}"
    
    erb = ERB.new(template)
    erb.result(scheme.binding_vars)
  end
end

def each_scheme
  Dir['./schemes/*'].map do |scheme_file|
    next unless scheme_file.end_with?('.yml')

    puts "we have scheme: #{scheme_file}"

    h = YAML.load_file(scheme_file)
    Scheme.new(h)
  end
end

def each_template
  Dir['./templates/*'].map do |template_dir|
    puts "we have template dir: #{template_dir}"

    dir = Pathname.new(template_dir)

    meta_file = dir.join('meta.yml')
    template_file = dir.join('template.erb')

    meta = YAML.load_file(meta_file)
    template = template_file.read

    Template.new(meta, template)
  end
end

each_scheme.each do |scheme|
  each_template.each do |template|
    output_dir = Pathname.new('output').join(scheme.scheme_name, template.template_name)
    output_dir.mkpath

    output_file = output_dir.join(template.output_filename)
    output_file.write(template.render(scheme))
  end
end
