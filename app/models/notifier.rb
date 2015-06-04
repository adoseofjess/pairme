class Notifier
  def initialize
    Slack::Post.configure(
      subdomain: ENV['SLACK_SUBDOMAIN'],
      token: ENV['SLACK_TOKEN'],
      username: 'Matchmaker'
    )
  end

  def pair_people
    users = User.where(available: true).shuffle
    pairings = []
    if users.count.odd?
      pairings.push(users.slice!(0,3))
    end
    users.each_slice(2).to_a.each { |pair| pairings.push(pair) }
    pairings
  end

  def format_pairings(pairings)
    pairings = pairings.map {|pair| pair.map{|person| person.name + ":coffee:"}.join ("     ") }.join("\n")
    <<-eos
    Coffee pairs:
#{pairings}
eos
  end

  def form_message
    format_pairings(pair_people)
  end
end