namespace :exif do
  desc "Scans the root directory for slides that aren't indexed and adds them"
  task(:scan_for_slides => :environment) do
  
    base_folder = '/Users/james/Desktop'
    search_pattern = '*.jpg'

    `find #{base_folder} -name '#{search_pattern}'`.split("\n").each {|file|

      unless Slide.find_by_original_file_name(file)
                                                                  
        exif = {}

        `exiftool '#{file.strip}'`.split("\n").collect{|a| 
          exif[(array = a.split(':')).first.strip] = (array.shift && array).join(':').strip
        }    
      
        Slide.create(:original_file_name => file, :meta_data => exif)      
        puts file
      
      end

    }
    
  end
end