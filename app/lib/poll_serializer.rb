class PollSerializer

  def self.count_per_month poll
    replies = poll.replies.group_by { |reply|
      reply.created_at.beginning_of_month
    }
    data = replies.map { |key, value| value.lenght } 
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

end