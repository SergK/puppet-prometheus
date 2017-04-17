require 'spec_helper'
describe 'prometheus' do
  context 'with default values for all parameters' do
    it { should contain_class('prometheus') }
  end
end
