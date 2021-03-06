require 'spec_helper'

describe Lmx::Builder do
  let(:builder) { described_class.new }

  let(:expected_xml) do
    "<catalog><book id=\"1\"><author>Hugo, Victor</author></book><book id=\"2\"><author>Proust, Marcel</author></book></catalog>"
  end

  describe '#build' do
    it 'builds xml' do
      expect(
        builder.build do
          node_catalog do
            node_book id: 1 do
              node_author do
                content 'Hugo, Victor'
              end
            end

            node_book id: 2 do
              node_author do
                content 'Proust, Marcel'
              end
            end
          end
        end
      ).to eq expected_xml
    end
  end
end
