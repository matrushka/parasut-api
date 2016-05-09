class ParasutApi
  module Core
    class Repository
      attr_reader :context, :klass, :options

      def initialize(context, klass, options = {})
        @options  = options
        @klass    = klass
        @context  = context
      end

      def find(id)
        parse_response @context.access_token.get(resource_url(id))
      rescue OAuth2::Error => e
        process_error e
      end

      def where(query)
        parse_response @context.access_token.get(resources_url, params: query)
      rescue OAuth2::Error => e
        process_error e
      end

      def all
        where({})
      end

      def new(attributes)
        new_record = @klass.new(attributes)
        new_record.repository = self
        new_record
      end

      def save(record)
        body      = { record.class.name.underscore.split('/').last => record }.as_json
        response  = record.id.present? ? @context.access_token.put(resource_url(record.id), body: body) : @context.access_token.post(resources_url, body: body)
        parse_response(response)
      end

      def parse_response(response)
        parsed = response.parsed

        if parsed['id'].present?
          build_record(parsed)
        elsif parsed[singular_key].present?
          build_record(parsed[singular_key])
        elsif parsed['items'].present?
          ParasutApi::Core::List.new parsed['items'].collect { |item| build_record(item) }, parsed['meta']
        else
          nil
        end
      end

      def singular_key
        @klass.name.underscore.split('/').last
      end

      def resource_url(id)
        build_url("#{@klass::URL}/:id", @options.merge({
          id: id
        }))
      end

      def resources_url
        build_url(@klass::URL, @options)
      end

      def process_error(error)
        fail ParasutApi::Core::Error.new(error.response.status, error.response.body)
      end

      def build_record(data) 
        record = @klass.new(data.deep_symbolize_keys)
        record.repository = self
        record
      end

      def build_url(template, options = {})
        @context.root + template.scan(/:[a-zA-Z0-9_-]+/).reduce(template.dup) do |url, match|
          url.gsub(match, options.fetch(match.tr(':','').to_sym).to_s)
        end
      end
    end
  end
end