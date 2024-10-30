namespace :generate do
  desc "Generate slugs for existing articles"
  task slugs: :environment do
    Article.find_each do |article|
      article.save
      puts "Generated slug for article #{article.id}: #{article.slug}"
    end
  end
end
