
require 'faker'

DIRECTORATES = ["ENG - Directorate for Engineering",
                "CSE - Directorate for Computer and Information Science and Engineering",
                "BIO - Directorate for Biological Sciences",
                "SBE - Directorate for Social, Behavioral, and Economic Sciences",
                "EHR - Directorate for Education and Human Resources",
                "MPS - Directorate for Mathematical and Physical Sciences"
               ]

NSF_ORGS = ["Division of Chemical, Bioengineering, Environmental, and Transport Systems",
            "Division of Research on Learning in Formal and Informal Settings",
            "Division of Civil, Mechanical, and Manufacturing Innovation",
            "Division of Biological Infrastructure",
            "Division of Integrative Organismal Systems",
            "Division of Mathematical Sciences",
            "Office of Emerging Frontiers and Multidisciplinary Activities"
           ]

NSF_PROGS = ["STTR Phase I",
             "STTR Phase I",
             "COVID-19 Research",
             "COVID-19 Research",
             "LS - Law and Science",
             "AISL - Advancing Informal STEM Learning",
            ]

NSF_CODES = ["158Y","1321","1997","7320","096Z","8030"]

def json_generate(number: 5)
  return unless number > 0
  puts "Generating JSON file"

  out_file = "sample#{number}.json"
  File.open(out_file, "w") { |f|  
    f.write "[\n" 
    for i in 1..number-1 do
      write_grant(outfile: f, index: i)
      f.write ",\n"
    end
    write_grant(outfile: f, index: number)
    f.write "\n]\n" 
  }
  puts "File written to #{out_file}"
end

def write_grant(outfile:, index: 0)
  return unless outfile
  if index % 100 == 0
    print "."
  end
  if index % 1000 == 0
    print index
  end
  grant = {
    "nid": "#{index}",
    "title": "#{Faker::Book.title}",
    "abstracttext": "#{Faker::Lorem.paragraph(sentence_count: 80)}",
    "abstracttexttrimmed": "#{Faker::Lorem.sentence(word_count: 20)}",
    "id": "#{Faker::Number.number(digits: 8)}",
    "fundsobligatedamt": "#{Faker::Number.number(digits: 6)}",
    "expdate": "#{Faker::Date.between(from: '2020-01-01', to: '2021-12-31')}",
    "date": "#{Faker::Date.between(from: '2020-01-01', to: '2021-12-31')}",
    "copdpi": copdpi,
    "latestdate": "#{Faker::Date.between(from: '2020-01-01', to: '2021-12-31')}",
    "link": "http://cuit.dev.columbia.edu/awards/#{Faker::Number.number(digits: 6)}",
    "directorate": DIRECTORATES.sample,
    "nsf_org": NSF_ORGS.sample,
    "fundprogramname": [ NSF_PROGS.sample ],
    "pdpiname": Faker::Name.name,
    "piemail": Faker::Internet.email,
    "pilink": "",
    "programelemcodes": [ NSF_CODES.sample ],
    "poname": Faker::Name.name,
    "programrefcodes": [ NSF_CODES.sample, NSF_CODES.sample ],
    "awardeeaddress": Faker::Address.street_address,
    "awardeecity": Faker::Address.city,
    "awardeename": Faker::University.name,
    "awardeestatecode": Faker::Address.state_abbr,
    "awardeezipcode": Faker::Address.zip_code,
    "startdate": "#{Faker::Date.between(from: '2020-01-01', to: '2020-12-31')}"
  }.to_json
  outfile.write(grant)
end

def copdpi
  # for each, add a random name
  result = []
  for i in 1..rand(0..4) do
    result << Faker::Name.name
  end
  result
end

json_generate(number: 5)
