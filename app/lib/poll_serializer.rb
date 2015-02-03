class PollSerializer

  def self.count_per_month poll
    replies = poll.replies.group_by { |reply|
      reply.created_at.beginning_of_month}
    data = replies.map { |key, value| value.length } 
    {
      data: data,
      x_axis: {
        legend: "Polls per month",
        series: replies.keys.map { |date| date.strftime("%b %Y") }
      },
      y_axis: {
        legend: "No. Polls",
        scale:  [0, data.max + 1 ]
      }
    }
  end

  def self.answers_per_question question
    answers_per_question = question.answers.group_by(&:possible_answer)
    data   = answers_per_question.map{ |possible_answers, answers| answers.length }
    series = answers_per_question.map{ |possible_answers, answers| possible_answers.title }
    {
      data: data,
      x_axis: {
        legend: "Polls per month",
        series: series
      },
      y_axis: {
        legend: "No. Polls",
        scale:  [0, (data.max or 0) + 1 ]
      }
    }
  end

end