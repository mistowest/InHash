require 'digest'

input_file = ARGV[0]
hash_algorithm = ARGV[1]
hashes = {"sha256" => Digest::SHA256,"md5" => Digest::MD5,"sha512" => Digest::SHA512,"sha1" => Digest::SHA1,}

if input_file.nil? || hash_algorithm.nil?
  puts "Usage: ruby hashfile.rb <input_dir> <hash_algorithm>"
  puts "Supported hash algorithms: #{hashes.keys.join(', ')}"
  exit
end

if hashes[hash_algorithm].nil?
  puts "Hash algorithm is not supported"
  exit
end

puts hashes[hash_algorithm].file input_file
