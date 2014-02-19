require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

module RailsExceptionHandlerAdmin
  describe ErrorMessagesController do

    routes { RailsExceptionHandlerAdmin::Engine.routes }

    before :each do
      ::RailsExceptionHandler::ActiveRecord::ErrorMessage.destroy_all
      ::RailsExceptionHandler::Mongoid::ErrorMessage.all.destroy
    end

    describe "GET index" do
      it "assigns all active record error_messages as @ar_error_messages" do
        error_message = create(:ar_error_message)
        get :index
        assigns(:ar_error_messages).should eq([error_message])
      end

      it "assigns all mongoid error_messages as @mg_error_messages" do
        error_message = create(:mg_error_message)
        get :index
        assigns(:mg_error_messages).should eq([error_message])
      end

      it "assigns both active record and mongoid error_messages as @ar_error_messages and @mg_error_messages" do
        ar_error_message = create(:ar_error_message)
        mg_error_message = create(:mg_error_message)
        get :index
        assigns(:ar_error_messages).should eq([ar_error_message])
        assigns(:mg_error_messages).should eq([mg_error_message])
      end
    end

    describe "GET show" do
      it "assigns the requested active record error_message as @error_message" do
        error_message = create(:ar_error_message)
        get :show, {:id => error_message.to_param}
        assigns(:error_message).should eq(error_message)
      end

      it "assigns the requested mongoid error_message as @error_message" do
        error_message = create(:mg_error_message)
        get :show, {:id => error_message.to_param}
        assigns(:error_message).should eq(error_message)
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested active record error_message" do
        error_message = create(:ar_error_message)
        mg_error_message = create(:mg_error_message)
        expect {
          delete :destroy, {:id => error_message.to_param}
        }.to change(::RailsExceptionHandler::ActiveRecord::ErrorMessage, :count).by(-1)
        expect { ::RailsExceptionHandler::ActiveRecord::ErrorMessage.find(error_message.id) }.to raise_error
        expect { ::RailsExceptionHandler::Mongoid::ErrorMessage.find(mg_error_message.id) }.not_to raise_error
      end

      it "destroys the requested mongoid error_message" do
        error_message = create(:mg_error_message)
        ar_error_message = create(:ar_error_message)
        expect {
          delete :destroy, {:id => error_message.to_param}
        }.to change(::RailsExceptionHandler::Mongoid::ErrorMessage, :count).by(-1)
        expect { ::RailsExceptionHandler::Mongoid::ErrorMessage.find(error_message.id) }.to raise_error
        expect { ::RailsExceptionHandler::ActiveRecord::ErrorMessage.find(ar_error_message.id) }.not_to raise_error
      end

      it "an active record, redirects to the error_messages list" do
        ar_error_message = create(:ar_error_message)
        mg_error_message = create(:mg_error_message)
        delete :destroy, {:id => ar_error_message.to_param}
        response.should redirect_to(error_messages_url)
      end

      it "an mongoid, redirects to the error_messages list" do
        ar_error_message = create(:ar_error_message)
        mg_error_message = create(:mg_error_message)
        delete :destroy, {:id => mg_error_message.to_param}
        response.should redirect_to(error_messages_url)
      end
    end

  end
end