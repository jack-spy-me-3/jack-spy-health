namespace :parse_data do
  desc "Import Health Center Data"
  task extract_health_centers: :environment do
    json_file = Unirest.get("https://data.cityofnewyork.us/resource/mzhu-ngrd.json").body
    HealthCenter.destroy_all
    json_file.each do |center|
      new_center = HealthCenter.create!(name_2: "", borough: center["__name_of_borough"], address: center["center_address"], name: center["name_of_center"], phone: center["telephone_number"], zip: center["zip"])
    end
  end

  desc "Import Mental Health Center Data"
  task extract_mental_health_centers: :environment do
    json_file = Unirest.get("https://data.cityofnewyork.us/resource/8nqg-ia7v.json").body
    MentalHealth.destroy_all
    json_file.each do |center|
      borough = center["city"].capitalize
      if borough == "New york"
        borough = "Manhattan"
      elsif borough == "Elmhurst" || borough == "Ridgewood" || borough == "Jamaica" || borough == "Flushing" || borough == "Far rockaway"
        borough = "Queens"
      end
      MentalHealth.create(name: center["name_1"], name_2: center["name_2"], borough: borough, zip: center["zip"], phone: center["phone"], address: "#{center["street_1"]} #{center["street_2"]}", website: center["website"])
    end
  end
end
