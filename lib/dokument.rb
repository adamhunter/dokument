require 'riak'

module Dokument

  def self.client
    @client ||= Riak::Client.new
  end

end

require "dokument/attachment"
require "dokument/association"
require "dokument/model"
require "dokument/version"
