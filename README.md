# Hackathon

## WebServer Api
To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
  
## Android

This is the Android api that will call the above server when the user does something in emag.

Here is a code example of how you can tell the server that the user added a product to the wishlist:

```Java
IFTTTApi.productAddedToWishList(ctx, productJson, new Response.Listener<JSONObject>() {
     @Override
     public void onResponse(JSONObject jsonObject) {
         jsonObject.toString();
     }
 },
 new Response.ErrorListener() {
     @Override
     public void onErrorResponse(VolleyError volleyError) {
         volleyError.toString();
     }});
```

## iOS

This is the iOS api that will call the above server when the user does something in emag.

Here is a code example of how you can tell the server that the user added a product to their cart:


```obj-c
- (void)trackAddToCartWithProduct:(SProduct *)product
{
    [[IFTTTTAPI new] addedToCart:product context:self];
}
```
