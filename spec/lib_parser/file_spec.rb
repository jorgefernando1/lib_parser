RSpec.shared_examples 'check instantiation params' do |parameters, error_message|
  it 'raise an error' do
    expect {
      described_class.new(parameters)
    }.to raise_error(ArgumentError, error_message)
  end
end

RSpec.describe LibParser::File do
  describe '#new' do
    context 'when any param is missing:' do
      describe 'file' do
        error_message = 'missing keyword: file'

        context 'when missing' do
          params = { separator: '-' }
          it_behaves_like('check instantiation params', params, error_message)
        end

        context 'when nil' do
          params = { file: nil, separator: '-' }
          it_behaves_like('check instantiation params', params, error_message)
        end

        context 'when is an empty string' do
          params = { file: '', separator: '-' }
          it_behaves_like('check instantiation params', params, error_message)
        end
      end

      describe 'separator' do
        error_message = 'missing keyword: separator'

        context 'when missing' do
          params = { file: '/path/to/file' }
          it_behaves_like('check instantiation params', params, error_message)
        end

        context 'when nil' do
          params = { file: '/path/to/file', separator: nil }
          it_behaves_like('check instantiation params', params, error_message)
        end

        context 'when is an empty string' do
          params = { file: '/path/to/file', separator: '' }
          it_behaves_like('check instantiation params', params, error_message)
        end
      end
    end

  end
end
