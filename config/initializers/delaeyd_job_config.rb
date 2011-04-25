Delayed::Worker.delay_jobs = !(Rails.env.development? or Rails.env.test?)
