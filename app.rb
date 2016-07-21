class PizzaShop < Sinatra::Base
  # INDEX - like index.html, a list of pizzas
  # GET "/pizzas" - Gets all the pizzas we have
  get "/pizzas" do
    @pizzas = Pizza.all
    erb "get all pizzas"
  end

  # GET FORM VIEW TO CREATE NEW PIZZA
  get "/pizzas/new" do
    erb "get form to create one pizza with id #{params[:id]}"
  end

  # SHOW - show details about just one pizza with id #{params[:id]}
  # GET "/pizzas/3" - Just get one specific pizza (that already exists)
  get "/pizzas/:id" do
    @pizza = Pizza.find( params[:id] )
    erb "get one pizza with id #{params[:id]}"
  end

  # GET FORM VIEW TO EDIT AN EXISTING PIZZA
  get "/pizzas/:id/edit" do
    erb "get form to create one pizza with id #{params[:id]}"
  end


  # CREATE - where the new form POSTs to, it does the actual creating
  # POST "/pizzas" - Create a new pizza, add it to our list
  post "/pizzas" do
    Pizza.create(
      name: 'Something Pizza',
      sauce: 'Curry Sauce',
      cheese: true,
      mushrooms: false,
      extra_toppings: 'shiitake mushrooms')

    erb "create one pizza with id #{params[:id]}"
  end

  # UPDATE - like CREATE, this does the actual updating
  # PUT "/pizzas/3" - Updates a specific pizza
  put "/pizzas/:id" do
    @the_pizza = Pizza.find(params[:id])
    @the_pizza.update_attributes(
      name: 'Anything Pizza', # hard coded updates
      sauce: 'indecisauciveness' # hard coded updates
    )

    erb "update one pizza with id #{params[:id]}"
  end

  # DESTROY - totally nukes a pizza from the database
  # DELETE "/pizzas/3" - Deletes a specific pizza
  delete "/pizzas/:id" do
    @deleted_pizza = Pizza.find(1)
    @deleted_pizza.destroy

    erb "delete one pizza with id #{params[:id]}"
  end
end
