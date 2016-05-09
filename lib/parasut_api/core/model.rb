class ParasutApi
  module Core
    class Model
      URL = ''

      attr_accessor :response, :repository

      include Virtus.model
      include Virtus.relations

      def repository
        @repository || self.try(:parent).try(:repository)
      end

      def context
        repository.try(:context)
      end

      def save
        fail 'Can not save a resource without a repository' if @repository.blank?
        @repository.save(self)
      end
    end
  end
end