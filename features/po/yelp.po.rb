module Pages
  class Yelp
    include Capybara::DSL

    def site_url
      visit 'https://yelp.com'
    end
    def initiate_browser
      if ENV['BROWSER'] == "ff"
        Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app, :browser => :firefox )
        end
      else
        Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app, :browser => :chrome )
        end
      end
    end
    def search_results ele
      find(ele)
    end
    def search_after_results ele
      sleep(20)
      find(ele)
    end
    def fill_with_id string, ele
      fill_in(id: ele, with: string)
    end
    def fill_with_class string, ele
      fill_in(with: string, class: ele)
    end
    def click_yelp_button ele
      click_button ele
    end
    def click_element ele
      find(ele).click
    end
    def find_yelp_element ele
      sleep(20)
      find(ele)
      sleep(20)
    end
    def get_element_star_rating ele
      find(ele)['title'].split(' ').first
    end
    def yelp_click_link ele
      click_link ele
    end
  end
end