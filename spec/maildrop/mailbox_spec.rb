require 'spec_helper'

describe Maildrop::Mailbox do
  it '#get returns a Mailbox model with name "test"' do
    mailbox = Maildrop::Mailbox.get('test')
    expect(mailbox).to be_instance_of(Maildrop::Models::Mailbox)
    expect(mailbox.name).to eq('test')
  end

  it '#get_random returns a Mailbox model with a random (12 hex char) name' do
    mailbox = Maildrop::Mailbox.random_get
    expect(mailbox).to be_instance_of(Maildrop::Models::Mailbox)
    expect(mailbox.name.size).to eq(12 * 2)
  end

  it '#emails returns a list of emails' do
    mailbox = Maildrop::Mailbox.get('test')
    expect(mailbox.emails).to be_kind_of(Array)
    expect(mailbox.emails.first).to be_kind_of(Maildrop::Models::Email)

    # TODO: add tests (VCR) for an empty mailbox.
  end
end
