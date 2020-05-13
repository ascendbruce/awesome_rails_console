require 'spec_helper'

require 'awesome_rails_console/prompts'

describe AwesomeRailsConsole::Prompts do
  describe '.choose_prompt_for_pry_version' do
    let(:old_prompt) { double('Pry.config.prompt') }

    before do
      expect(Pry.config).to receive(:prompt).and_return(old_prompt)
    end

    context 'pry version < 0.13.0' do
      before do
        stub_const("Pry::VERSION", '0.12.2')
      end

      it 'uses pre-0.13.0 prompt' do
        expect(described_class).to receive(:pre_pry_13_prompt).with(old_prompt)
        described_class.choose_prompt_for_pry_version
      end
    end

    context 'pry version >= 0.13.0' do
      before do
        stub_const("Pry::VERSION", '0.13.1')
      end

      it 'uses post-0.13.0 prompt' do
        expect(described_class).to receive(:post_pry_13_prompt).with(old_prompt)
        described_class.choose_prompt_for_pry_version
      end
    end
  end
end
