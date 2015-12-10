json.array!(@contatos) do |contato|
  json.extract! contato, :id, :nome, :email, :tel, :endereco, :obs
  json.url contato_url(contato, format: :json)
end
