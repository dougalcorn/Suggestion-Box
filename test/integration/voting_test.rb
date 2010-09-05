require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest

  context "visiting the list of suggestions with a suggestion" do
    setup do
      @suggestion = Factory(:topic)
      visit topics_path
    end
    should "have a vote link" do
      assert(page.has_css?("a[href='#{vote_topic_path(@suggestion)}']"),
             "Where's the link to #{vote_topic_path(@suggestion)}? ")
    end

    context "voting for the topic" do
      setup do
        @old_vote_count = @suggestion.votes.count
        within(:css, "#topic_#{@suggestion.id}") do
          click "Vote"
        end
      end
      should "have a message in flash" do
        within(:css, ".flash") do
          assert page.has_content?("Thanks"), "Not even a thank you? "
        end
      end
      should "respond with success" do
        assert_equal 200, page.status_code
      end
      should "add a vote for this topic" do
        assert_equal @old_vote_count + 1, @suggestion.votes(true).count, "Where's the vote? "
      end
    end
  end
end