require 'spec_helper'

describe Maildrop::HTTP do
  it 'gets a mailbox and returns the body' do
    http = Maildrop::HTTP.new
    response = http.get('test_mailbox')
    expect(response).to be_kind_of(String)
  end

  it 'throws an error when something goes wrong' do
    http = Maildrop::HTTP.new
    expect { http.get('../404') }.to raise_error(Maildrop::HTTP::NotFound)

    # TODO: expand for different errors.
  end
end
