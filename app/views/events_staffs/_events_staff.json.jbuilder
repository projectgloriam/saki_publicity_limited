json.extract! events_staff, :id, :event_id, :staff_id, :staff_qr_code, :created_at, :updated_at
json.url events_staff_url(events_staff, format: :json)