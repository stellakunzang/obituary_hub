require "rails_helper"

describe "ObituaryService" do
  it "returns obituary hashes" do
    service  = ObituaryService.new
    obituaries = service.get_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first[:data][:type]).to eq('obituary')
    expect(obituaries.first[:data][:attributes]).to have_key :headline
  end

  it "returns covid obituaries" do
    service  = ObituaryService.new
    obituaries = service.get_covid_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first[:data][:attributes][:abstract].downcase.includes?('coronavirus')).to eq(true)
  end
end
