require 'spec_helper'

describe Maildrop::Models::Email do
  before(:all) do
    mailbox = Maildrop::Mailbox.get('test')
    @email = mailbox.emails.first
  end

  it 'returns an Email model' do
    expect(@email).to be_instance_of(Maildrop::Models::Email)
  end

  it 'has an id that is a string' do
    expect(@email.id).to be_instance_of(String)
  end

  it 'has a subject that is a string' do
    expect(@email.subject).to be_instance_of(String)
  end

  it 'has an body that is a string' do
    expect(@email.body).to be_instance_of(String)
  end

  it 'has a date that is a DateTime object' do
    expect(@email.date).to be_instance_of(DateTime)
  end
end
