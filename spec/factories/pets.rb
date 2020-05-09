FactoryBot.define do
  factory :pet do
      image { "https://whatyouth.com/wp-content/uploads/2016/03/whatyouth_lizard_submission_photo-256x256.jpg" }
      name  { "Frank" }
      approximate_age { 3 }
      sex { ["Female", 'Male'].shuffle.first }
      shelter
  end
end
