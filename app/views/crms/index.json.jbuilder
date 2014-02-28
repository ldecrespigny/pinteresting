json.array!(@crms) do |crm|
  json.extract! crm, :id, :title, :summary, :rating
  json.url crm_url(crm, format: :json)
end
