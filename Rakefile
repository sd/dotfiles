require 'fileutils'

desc "Install everything into the system"
task :default => :symlinks

desc "Only symlink files"
task :symlinks do
  linkables = Dir.glob('*/**{.symlink}') + Dir.glob('*/dot-**')

  skip_all = ENV['SKIP'] || false
  overwrite_all = ENV['OVERWRITE'] || false
  backup_all = ENV['BACKUP'] || false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.gsub(/\.symlink$/, "").gsub(/^dot-/, "")
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end
