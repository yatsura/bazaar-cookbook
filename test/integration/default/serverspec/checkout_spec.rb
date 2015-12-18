require 'serverspec'

set :backend, :exec

describe 'bazaar_test::checkout' do
  context 'tag 1.0 checkout' do
    let(:location) { '/tmp/checkout/1.0' }

    it 'creates the location' do
      expect(file(location)).to be_directory
    end

    it 'create the files for version 1.0' do
      expect(file("#{location}/file")).to exist
      expect(file("#{location}/new_file")).to exist
    end

    it 'should not create files for version 1.1' do
      expect(file("#{location}/new_file_between_1.0_and_1.1"))
    end

    it 'should not create files after version 1.1' do
      expect(file("#{location}/new_file_after_1.1"))
    end

    it 'should have the version as 1.0' do
      expect(file("#{location}/version").content).to eq("1.0\n")
    end
  end

  context 'tag 1.1 checkout' do
    let(:location) { '/tmp/checkout/1.1' }

    it 'creates the location' do
      expect(file(location)).to be_directory
    end

    it 'create the files for version 1.0' do
      expect(file("#{location}/file")).to exist
      expect(file("#{location}/new_file")).to exist
    end

    it 'should create files for version 1.1' do
      expect(file("#{location}/new_file_between_1.0_and_1.1"))
    end

    it 'should not create files after version 1.1' do
      expect(file("#{location}/new_file_after_1.1"))
    end

    it 'should have the version as 1.1' do
      expect(file("#{location}/version").content).to eq("1.1\n")
    end
  end

end
