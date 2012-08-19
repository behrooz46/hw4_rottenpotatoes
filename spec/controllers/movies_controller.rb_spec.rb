require 'spec_helper'
describe MoviesController do
  describe 'edit page for appropriate Movie' do
    it 'When I go to the edit page for the Movie, it should be loaded' do
      mock = mock('Movie')
      Movie.should_receive(:find).with('13').and_return(mock)
      get :edit, {:id => '13'}
      response.should be_success
    end
    
    it 'And I fill in "Director" with "Ridley Scott", And I press "Update Movie Info", it should save the director' do
      mock = mock('Movie')
      mock.stub!(:update_attributes!)
      mock.stub!(:title)
      mock.stub!(:director)
      
      mock2 = mock('Movie')
      
      Movie.should_receive(:find).with('13').and_return(mock)
      mock.should_receive(:update_attributes!)
      post :update, {:id => '13', :movie => mock2 }
    end
  end
end
