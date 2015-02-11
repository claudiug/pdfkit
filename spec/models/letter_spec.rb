require 'rails_helper'

describe Letter do
  it "is valid with name, email, link" do
    letter = Letter.new(
      name: 'foo',
      email: 'example@example.net',
      link: 'https://aws-s3-link-file-location.pdf',
      key: '23weedfr54445^',
      deleted: false)
    letter.valid?
    expect(letter).to be_valid
  end

  it "is invalid without name," do
    letter = Letter.new(
      name: nil,
      email: 'example@example.net',
      link: 'https://aws-s3-link-file-location.pdf',
      key: '23weedfr54445^',
      deleted: false)
    letter.valid?
    expect(letter.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    letter = Letter.new(
      name: "foo",
      email: nil,
      link: 'https://aws-s3-link-file-location.pdf',
      key: '23weedfr54445^',
      deleted: false)
    letter.valid?
    expect(letter.errors[:email]).to include("can't be blank")
  end

  it "is invalid without link" do
    letter = Letter.new(
      name: "foo",
      email: 'example@example.net',
      link: nil,
      key: '23weedfr54445^',
      deleted: false)
    letter.valid?
    expect(letter.errors[:link]).to include("can't be blank")
  end

  it "has default value for deleted: false" do
    letter = Letter.new(
      name: "foo",
      email: 'example@example.net',
      link: 'https://aws-s3-link-file-location.pdf',
      key: '23weedfr54445^')
    letter.save
    expect(letter.deleted).to eq false
  end

  it "generate unique keys after save" do
    letter = Letter.new(
      name: nil,
      email: 'example@example.net',
      link: 'https://aws-s3-link-file-location.pdf',
      key: nil,
      deleted: false)
    letter.save
    expect(letter.key).not_to be_nil
  end

  it "validates email format" do
    letter = Letter.new(
      name: "foo",
      email: 'example@111',
      link: 'https://aws-s3-link-file-location.pdf',
      key: '23weedfr54445^',
      deleted: false)
    expect(letter.errors[:name]).to include("can't be blank")
  end
end
