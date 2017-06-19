namespace :parse_data do
  desc "Import Health Center Data"
  task extract_health_centers: :environment do
    json_file = Unirest.get("https://data.cityofnewyork.us/resource/mzhu-ngrd.json").body
    HealthCenter.destroy_all
    json_file.each do |center|
      new_center = HealthCenter.create!(borough: center["__name_of_borough"], address: center["center_address"], name: center["name_of_center"], phone: center["telephone_number"], zip: center["zip"])
    end
  end
end
