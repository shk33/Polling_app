require "test_helper"

class PollSerializerCountPerMonthTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  attr_reader :poll

  def setup
    @poll = create :full_poll, replies_count: 5, questions_count: 5 
    @stats = PollSerializer.count_per_month(poll) 
  end

  def test_retrieves_data_in_the_form_on_an_array
    assert_includes @stats.keys, :data
  end

end