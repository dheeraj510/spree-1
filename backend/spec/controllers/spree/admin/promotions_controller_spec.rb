require 'spec_helper'

describe Spree::Admin::PromotionsController do
  stub_authorization!

  let!(:promotion) { create(:promotion) }

  pending "can create a promotion with a valid calculator type" do
    spree_post :create, :promotion => { :calculator_type => "Spree::Calculator::FlatPercentItemTotal" }
    response.should be_redirect
    response.should redirect_to spree.edit_admin_promotion_path(promotion)
    promotion.calculator_type.should == "Spree::Calculator::FlatPercentItemTotal"
  end

  pending "can not create a promotion with an invalid calculator type" do
    spree_post :create, :promotion_id => promotion.id, :action_type => "Spree::InvalidType"
    response.should be_redirect
    response.should redirect_to spree.edit_admin_promotion_path(promotion)
    promotion.rules.count.should == 0
  end
end
