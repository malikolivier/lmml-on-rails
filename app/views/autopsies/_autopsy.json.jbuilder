json.extract! autopsy, :id, :completed, :number, :suspect_id, :victim_id,
              :place_id, :autopsy_date, :starting_time, :ending_time,
              :examiner_id,
              :police_station_id, :police_inspector_id, :court_id,
              :judge_id, :created_at, :updated_at
json.url autopsy_url(autopsy, format: :json)
