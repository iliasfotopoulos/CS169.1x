# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1) < page.body.index(e2)
end


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(%r{\s*,\s*}).each do |rating|
    uncheck ? uncheck("ratings_#{rating}") : check("ratings_#{rating}")
  end
end

Then /I should (not )?see movies with the following ratings: (.*)/ do |notsee, rating_list|
  ratings = rating_list.split(%r{\s*,\s*})
  Movie.where(rating: ratings).find_each do |movie|
    notsee ? ( page.should_not have_content(movie.title) ) : ( page.should have_content(movie.title) )
  end
end


Then /I should see all the movies/ do
  Movie.find_each do |movie|
    page.should have_content(movie.title)
  end
end
