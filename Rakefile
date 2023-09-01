require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md macos.md Sublime].include? file

    if File.exist? "#{Dir.home}/.#{file}"
      if same? file
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite #{file} with ~/.#{file}? [ynaqu] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

task :default => :install

def replace_file(file)
  system %Q{rm -rf "#{file}"}
  system %Q{mv "#{Dir.home}/.#{file}" "#{Dir.pwd}/#{file}"}
  system %Q{ln -s "#{Dir.pwd}/#{file}" "#{Dir.home}/.#{file}"}
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "#{Dir.pwd}/#{file}" "#{Dir.home}/.#{file}"}
end

def same?(file)
  in_home = "#{Dir.home}/.#{file}"
  in_repo = "#{Dir.pwd}/#{file}"
  File.symlink?(in_home) and File.readlink(in_home).eql?(in_repo)
end
