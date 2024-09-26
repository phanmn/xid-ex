#[rustler::nif]
fn generate() -> String {
    xid::new().to_string()
}

#[rustler::nif]
fn generate_with_timestamp(timestamp: u64) -> String {
    xid::new_with_timestamp(timestamp).to_string()
}

rustler::init!("Elixir.Xid", [generate, generate_with_timestamp]);
