#[rustler::nif]
fn generate() -> String {
    xd::new().to_string()
}

#[rustler::nif]
fn generate_with_timestamp(timestamp: u64) -> String {
    xd::new_with_timestamp(timestamp).to_string()
}

rustler::init!("Elixir.Xid");
