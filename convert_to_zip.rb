require 'rubygems'
require 'zip'

folder = "Users/me/Desktop/stuff_to_zip"
input_filenames = ['image.jpg', 'description.txt', 'stats.csv']

zipfile_name = "/Users/me/Desktop/archive.zip"

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
  input_filenames.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, File.join(folder, filename))
  end
  zipfile.get_output_stream("myFile") { |f| f.write "myFile contains just this" }
end
