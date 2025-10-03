use rustler::{Error};
use std::str::FromStr;

#[rustler::nif]
fn generate() -> String {
    xd::new().to_string()
}

#[rustler::nif]
fn generate_with_timestamp(timestamp: u64) -> String {
    xd::new_with_timestamp(timestamp).to_string()
}

#[rustler::nif]
fn extract_timestamp(id_string: String) -> Result<u64, Error> {
    // Parse the string into an Id
    let id = xd::Id::from_str(&id_string)
        .map_err(|_| Error::Term(Box::new("Invalid ID format")))?;
    
    // Extract timestamp as seconds since Unix epoch
    let timestamp = id.time()
        .duration_since(std::time::UNIX_EPOCH)
        .map_err(|_| Error::Term(Box::new("Invalid timestamp")))?
        .as_secs();
    
    Ok(timestamp)
}

rustler::init!("Elixir.Xid");
