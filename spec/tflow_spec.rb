require 'spec_helper'

describe Tflow do
  it 'has a version number' do
    expect(Tflow::VERSION).not_to be nil
  end

  it '.new' do
    Tflow.new("http://10.0.0.1").should be_a Tflow::ApiClient
  end

  it '.respond_to?' do
    Tflow.respond_to?(:new).should be true
  end
end
