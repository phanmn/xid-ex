#[rustler::nif]
fn generate() -> String {
    xid::new().to_string()
}

rustler::init!("Elixir.Xid", [generate]);
