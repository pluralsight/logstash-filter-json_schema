# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/json_schema"

describe LogStash::Filters::JsonSchema do
  describe "Validating schema against default source field" do
    let(:config) do <<-CONFIG
      filter {
        json_schema {
          schema => '{"type": "object", "properties": {"userId": {"type": "string" } }, "required":["userId"] }'
        }
      }
    CONFIG
    end

    sample("message" => "{}") do
      expect(subject).to include("tags")
      expect(subject.get('tags')).to include('jsonschemafailure')
    end
    sample("message" => '{"userId": "123" }') do
      expect(subject).not_to include("tags")
    end
  end

  describe "Validating schema against specified source field" do
    let(:config) do <<-CONFIG
      filter {
        json_schema {
          schema => '{"type": "object", "properties": {"userId": {"type": "string" } }, "required":["userId"] }'
          source => source_field
        }
      }
    CONFIG
    end

    sample("source_field" => "{}") do
      expect(subject).to include("tags")
      expect(subject.get('tags')).to include('jsonschemafailure')
    end
    sample("source_field" => '{"userId": "123" }') do
      expect(subject).not_to include("tags")
    end
  end
end
