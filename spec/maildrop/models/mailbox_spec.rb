require 'spec_helper'

describe Maildrop::Models::Mailbox do
  before(:all) do
    @mailbox = Maildrop::Mailbox.get('test')
  end

  it 'has a name that is a string' do
    expect(@mailbox.name).to be_instance_of(String)
  end

  it 'has an email address that is a string' do
    expect(@mailbox.address).to be_instance_of(String)
  end

  it 'returns a list of emails' do
    expect(@mailbox.emails).to be_kind_of(Array)
    expect(@mailbox.emails.first).to be_kind_of(Maildrop::Models::Email)

    # TODO: add tests (VCR) for an empty mailbox.
  end
end
