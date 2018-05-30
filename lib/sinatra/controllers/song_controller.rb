module SinatraSandbox
  class SongController < Sinatra::Base
    enable :method_override

    get('/styles.css'){ scss :styles }
    set :public_folder, "#{SINATRA_PATH}/public"
    set :views, "#{SINATRA_PATH}/views"

    helpers SongHelpers, AuthHelpers

    before do
      set_title
    end

    configure do
      enable :sessions
      set :username, 'frank'
      set :password, 'sinatra'
    end

    configure :development do
      options = YAML.load_file('config/database.yml')
      DataMapper.setup(:default, options['development'])

    end

    configure :production do
      options = YAML.load_file('config/database.yml')
      DataMapper.setup(:default, options['production'])
    end

    before do
      set_title
    end

    def css(*stylesheets)
      stylesheets.map do |stylesheet|
        "<link href=\"/#{stylesheet}.css\" media=\"screen, projection\" rel=\"stylesheet\" />"
      end.join
    end

    def current?(path='/')
      (request.path==path || request.path==path+'/') ? "current" : nil
    end

    def set_title
      @title ||= "Songs By Sinatra"
    end

    get '/' do
      find_songs
      slim :songs
    end

    get '/new' do
      # protected!
      @song = Song.new
      slim :new_song
    end

    get '/:id' do
      # protected!
      @song = find_song
      slim :show_song
    end

    get '/:id/edit' do
      # protected!
      @song = find_song
      slim :edit_song
    end

    post '/' do
      # protected!
      if create_song
        # flash[:notice] = "Song successfully added"
      end
      redirect to("/#{@song.id}")
    end

    put '/:id' do
      song = find_song
      if song.update(params[:song])
        # flash[:notice] = "Song successfully updated"
      end
      redirect to("/#{song.id}")
    end

    delete '/:id' do
      # protected!
      if find_song.destroy
        # flash[:notice] = "Song deleted"
      end
      redirect to('/')
    end
  end
end