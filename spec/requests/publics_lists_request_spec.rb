require 'spec_helper'
require 'rails_helper'

RSpec.describe "privacy lists", :type => :request do
  it "show only privacy lists" do
    list_pub = List.create!(:name => "nome_teste", :privacy => "true")
    list_priv = List.create!(:name => "nome_teste_private", :privacy => "false")
    get "/lists/publics"
    assert_select "div" do
      assert_select "input[name=?]", "name"
      assert_select "input[privacy=?]", "true"
      assert_select "input[type=?]", "submit"
    end

    post "/lists", :name => "nome_teste", :privacy => "true"
    assert_select ".row ", :text => "nome_teste"
  end
end


