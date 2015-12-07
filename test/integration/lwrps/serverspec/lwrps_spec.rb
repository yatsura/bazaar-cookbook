#
# Cookbook Name:: bazaar_test
# Recipe:: lwrps
#
# Copyright 2015, University of Edinburgh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative './spec_helper'

describe 'bazaar_test::lwrps' do
  context 'tag 1.0 checkout' do
    let(:location) { '/tmp/location/1.0' }

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
    let(:location) { '/tmp/location/1.1' }

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
