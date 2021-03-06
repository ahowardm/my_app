class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: { only_integer: true }

  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @product, notice: 'Review was created successfully.' }
        format.json {render :show, status: created, location: @product }
      else
        format.html {redirec_to @product, notice: 'Review was not saved successfully.' }
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end
end
