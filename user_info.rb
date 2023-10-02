require 'rest-client'
require 'json'

def fetch_user(username)
    url = url = "https://api.github.com/users/#{username}"
    response = RestClient.get(url)
    return JSON.parse(response.body) if response.code == 200
    nil
end

def display_info(user_info)
  return  "Usuário não encontrado." if user_info.nil?
  puts"Nome: #{user_info['name']}"
  puts"Login: #{user_info['login']}"
  puts "Localização: #{user_info['location']}"
  puts "Bio: #{user_info['bio']}"
  puts "Repositórios públicos: #{user_info['public_repos']}"

end

def main
  print "Digite o nome do usuário do Github: "
    username = gets.chomp

    user_info = fetch_user(username)
    display_info(user_info)
end


main
