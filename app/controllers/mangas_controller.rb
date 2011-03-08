class MangasController < ApplicationController
  def index
    @mangas = Manga.all(:order => "updated_at DESC")
  end

  def show
    @manga = Manga.find params[:id]
  end

  def new
    @items = search_from_amazon(params[:query])
  end

  def create
    @manga = Manga.new(params[:manga]) do |m|
      m.user = current_user
    end
    begin
      @manga.save!
      @manga.post_link_to_facebook
      redirect_to mangas_url, :notice => "Successfully created manga."
    rescue ActiveRecord::RecordInvalid => e
      redirect_to :action => "new", :query => params[:query]
    rescue Timeout::Error => e
      logger.error "[Timeout::Error] #{e}"
      redirect_to mangas_url, :notice => "Successfully created manga."
    end
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id]) do |m|
      m.user = current_user
    end

    if @manga.update_attributes(params[:manga])
      redirect_to mangas_url, :notice  => "Successfully updated manga."
    else
      render :action => 'edit'
    end
  end

private
  # mock
  def user_country
    @user_lang ||= :jp # (rest_graph.lang[/^[a-z]{2}/]).to_sym
  end

  def search_from_amazon(query)
    @res = query ? Amazon::Ecs.item_search(query, :country => user_country, :response_group => "Medium"): nil
    items = @res.try(:items) || []
    items
  end

  def get_data_from_asin(asin_code)
    resp = Amazon::Ecs.item_lookup(asin_code, :country => user_country)
    if resp and resp.is_valid_request? and !resp.has_error?
      title = resp.first_item.get('itemattributes/title')
      author = resp.first_item.get_elements('author').map(&:get).join(', ')
      [title, author]
    end
  end
end
